import datetime

from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from crt.models import Team, Player, League, Match, Point


class TeamTemplateView(ListView):
    model = Team
    template_name = 'team-index.html'

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(TeamTemplateView, self).get_context_data(**kwargs)
        context['leagues'] = League.objects.all()
        return context


class TeamDetailView(DetailView):
    model = Team
    template_name = 'team-detail.html'

    def get_context_data(self, **kwargs):
        context = super(TeamDetailView, self).get_context_data(**kwargs)
        context['players'] = Player.objects.filter(team=self.kwargs.get('pk'))
        return context


class AllFixturesView(TeamTemplateView):
    template_name = 'all-fixtures.html'

    def get_context_data(self, **kwargs):
        context = super(AllFixturesView, self).get_context_data(**kwargs)
        today = datetime.datetime.today()
        context['matches'] = Match.group_by_date(date__gt=today)
        print(Match.group_by_date())
        return context


class PointsDetailView(DetailView):
    model = League
    template_name = 'points-table.html'

    def get_context_data(self, **kwargs):
        context = super(PointsDetailView, self).get_context_data(**kwargs)
        context['points'] = Point.objects.filter(league=self.kwargs.get('pk')).order_by('-points')
        return context
