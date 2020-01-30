import itertools
import operator
import os
import time
from datetime import date, datetime

from django.db import models
from django.db.models import Q, Max
from django.urls import reverse


def get_current_year():
    return date.today().year


def upload_to_path(instance, filename):
    ext = filename.split('.')[-1]
    filename = "%s_%s.%s" % ("team_img", (time.time() * 1000), ext)
    return os.path.join(instance.__class__.__name__.lower(), filename)


class Team(models.Model):
    name = models.CharField(max_length=50)
    logo_uri = models.ImageField(upload_to=upload_to_path, null=True, blank=True)
    club_state = models.CharField(max_length=40, null=True, blank=True, default=None)
    created_at = models.DateTimeField('date created', auto_now_add=True)
    updated_at = models.DateTimeField('date updated', auto_now=True)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('crt:team-detail', kwargs={'pk': self.pk})

    class Meta:
        verbose_name = 'team'
        db_table = 'teams'


class Player(models.Model):
    first_name = models.CharField(max_length=40)
    last_name = models.CharField(max_length=40)
    image_uri = models.ImageField(upload_to=upload_to_path, null=True, blank=True)
    jersey_number = models.PositiveIntegerField(default=0)
    dob = models.DateField(null=True, blank=True, default=None)
    country = models.CharField(max_length=50, null=True, blank=True)
    team = models.ForeignKey('Team', on_delete=models.CASCADE, null=True, blank=True, default=None)
    created_at = models.DateTimeField('date created', auto_now_add=True)
    updated_at = models.DateTimeField('date updated', auto_now=True)

    def __str__(self):
        return str(self.first_name) + ' ' + str(self.last_name)

    def get_50s(self, season=(get_current_year(),), teams=()):
        if not teams:
            teams = self.team.id,
        return BatPerformance.objects.filter(Q(match__team_1__id__in=teams) | Q(match__team_2__id__in=teams),
                                             player__id=self.pk, match__date__year__in=season,
                                             bat=True, bat_runs__range=[50, 99]).count()

    def get_100s(self, season=(get_current_year(),), teams=()):
        if not teams:
            teams = self.team.id,
        return BatPerformance.objects.filter(Q(match__team_1__id__in=teams) | Q(match__team_2__id__in=teams),
                                             player__id=self.pk, match__date__year__in=season,
                                             bat=True, bat_runs__gte=100).count()

    def get_high_score(self, season=(get_current_year(),), teams=()):
        if not teams:
            teams = self.team.id,
        return BatPerformance.objects.filter(
            Q(match__team_1__id__in=teams) | Q(match__team_2__id__in=teams),
            player__id=self.pk, match__date__year__in=season,
        ).aggregate(Max('bat_runs'))['bat_runs__max']

    def get_matches(self, season=(get_current_year(),), teams=()):
        if not teams:
            teams = self.team.id,
        return Performance.objects.filter(Q(match__team_1__id__in=teams) | Q(match__team_2__id__in=teams),
                                          player__id=self.pk, match__date__year__in=season).count()

    class Meta:
        verbose_name = 'player'
        db_table = 'players'


class League(models.Model):
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField('date created', auto_now_add=True)
    updated_at = models.DateTimeField('date updated', auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'league'
        db_table = 'leagues'


class Competition(models.Model):
    name = models.CharField(max_length=255)
    competition_type = models.CharField(max_length=32, null=True)
    league = models.ForeignKey('League', on_delete=models.CASCADE)
    created_at = models.DateTimeField('date created', auto_now_add=True)
    updated_at = models.DateTimeField('date updated', auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'competition'
        db_table = 'competitions'


class Match(models.Model):
    TOSS_DECISION = ((0, '----'), (1, 'bat'), (2, 'field'))
    WIN_TYPE = ((0, '----'), (1, 'by runs'), (2, 'by wickets'))
    competition = models.ForeignKey('Competition', on_delete=models.CASCADE)
    date = models.DateTimeField()
    venue_name = models.CharField(max_length=50, default='')
    team_1 = models.ForeignKey('Team', on_delete=models.CASCADE, related_name='team_1')
    team_2 = models.ForeignKey('Team', on_delete=models.CASCADE, related_name='team_2')
    toss_winner_team = models.ForeignKey('Team', on_delete=models.CASCADE, related_name='toss_winner_team', null=True,
                                         blank=True, default=None)
    toss_decision = models.PositiveSmallIntegerField(choices=TOSS_DECISION, default=0)
    last_updated = models.DateTimeField(auto_now=True)
    is_super_over = models.BooleanField(default=False)
    is_result = models.BooleanField(default=False)
    is_duck_worth_lewis = models.BooleanField(default=False)
    win_type = models.PositiveSmallIntegerField(choices=WIN_TYPE, default=0)
    won_by = models.PositiveIntegerField(default=0)
    match_winner_team = models.ForeignKey('Team', on_delete=models.CASCADE, related_name='match_winner_team',
                                          default=None, null=True, blank=True)
    man_of_the_match = models.ForeignKey('Player', on_delete=models.CASCADE, related_name='man_of_the_match',
                                         default=None, null=True, blank=True)
    first_umpire_id = models.ForeignKey('Player', on_delete=models.CASCADE, related_name='first_umpire_id',
                                        default=None, null=True, blank=True)
    second_umpire_id = models.ForeignKey('Player', on_delete=models.CASCADE, related_name='second_umpire_id',
                                         default=None, null=True, blank=True)
    city_name = models.CharField(max_length=50, null=True, blank=True)
    host_country = models.CharField(max_length=50, null=True, blank=True)
    match_notes = models.TextField(max_length=515, null=True, blank=True)
    number_of_players = models.IntegerField(default=0)
    processing_issue = models.BooleanField(default=False)
    created_at = models.DateTimeField('date created', auto_now_add=True)
    updated_at = models.DateTimeField('date updated', auto_now=True)

    def __str__(self):
        return "{} | {} | {}".format(self.date, self.venue_name, self.city_name)

    @staticmethod
    def group_by_date(**kwargs):
        matches = Match.objects.filter(**kwargs).order_by('date')
        keyfunc = operator.attrgetter('date')
        print(matches)
        return [{k.strftime('%d-%m-%Y'): list(g)} for k, g in itertools.groupby(matches, keyfunc)]

    class Meta:
        verbose_name = 'match'
        db_table = 'matches'


class Performance(models.Model):
    match = models.ForeignKey('Match', on_delete=models.CASCADE)
    player = models.ForeignKey('Player', on_delete=models.CASCADE)
    captain = models.BooleanField(default=False)
    vice_captain = models.BooleanField(default=False)
    wicket_keeper = models.BooleanField(default=False)
    is_umpire = models.BooleanField(default=False)
    created_at = models.DateTimeField('date created', auto_now_add=True)
    updated_at = models.DateTimeField('date updated', auto_now=True)

    def __str__(self):
        return str(self.player) + ': ' + str(self.match)

    class Meta:
        verbose_name = 'performance'
        db_table = 'performances'


class BatPerformance(models.Model):
    match = models.ForeignKey('Match', on_delete=models.CASCADE)
    player = models.ForeignKey('Player', on_delete=models.CASCADE)

    bat = models.BooleanField(default=False)
    bat_position = models.IntegerField(default=0)
    bat_runs = models.IntegerField(default=0)
    bat_par_score = models.IntegerField(default=0)
    bat_balls = models.IntegerField(default=0)
    bat_how_out = models.CharField(max_length=32, default='DNB')
    bat_out_bowler = models.ForeignKey('Player', on_delete=models.CASCADE, related_name='bat_bowler', blank=True,
                                       null=True)
    bat_out_fielder = models.ForeignKey('Player', on_delete=models.CASCADE, related_name='bat_fielder', blank=True,
                                        null=True)
    bat_inning_no = models.IntegerField(default=0)
    created_at = models.DateTimeField('date created', auto_now_add=True)
    updated_at = models.DateTimeField('date updated', auto_now=True)

    def __str__(self):
        return str(self.player) + ': ' + str(self.match)

    class Meta:
        verbose_name = 'bat_performance'
        db_table = 'bat_performances'


class BowlPerformance(models.Model):
    match = models.ForeignKey('Match', on_delete=models.CASCADE)
    player = models.ForeignKey('Player', on_delete=models.CASCADE)

    bowl = models.BooleanField(default=False)
    bowl_overs = models.FloatField(default=0)
    bowl_runs = models.IntegerField(default=0)
    bowl_maidens = models.IntegerField(default=0)
    bowl_position = models.IntegerField(default=0)
    bowl_pareconomy = models.FloatField(default=0.0)
    bowl_wickets_lbw = models.IntegerField(default=0)
    bowl_wickets_bowled = models.IntegerField(default=0)
    bowl_wickets_stumped = models.IntegerField(default=0)
    bowl_wickets_caught = models.IntegerField(default=0)
    bowl_wickets_hit_wicket = models.IntegerField(default=0)
    bowl_wickets_total = models.IntegerField(default=0)
    bowl_inning_no = models.IntegerField(default=0)
    created_at = models.DateTimeField('date created', auto_now_add=True)
    updated_at = models.DateTimeField('date updated', auto_now=True)

    def __str__(self):
        return str(self.player) + ': ' + str(self.match)

    class Meta:
        verbose_name = 'bowl_performance'
        db_table = 'bowl_performances'


class Point(models.Model):
    league = models.ForeignKey('League', on_delete=models.CASCADE, default=None)
    team = models.ForeignKey('Team', on_delete=models.CASCADE)
    points = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.points)

    def get_total_matches(self):
        return Match.objects.filter(Q(team_1__id=self.team.id) | Q(team_2_id=self.team.id),
                                    processing_issue=False, date__lte=(datetime.today())).count()

    def get_won_matches(self):
        return Match.objects.filter(Q(match_winner_team=self.team.id), date__lte=(datetime.today())).count()

    def get_lost_matches(self):
        return Match.objects.filter(Q(team_1__id=self.team.id) | Q(team_2_id=self.team.id),
                                    processing_issue=False, date__lte=(datetime.today())).exclude(
            match_winner_team=self.team.id).count()

    class Meta:
        verbose_name = 'point'
        db_table = 'points'
