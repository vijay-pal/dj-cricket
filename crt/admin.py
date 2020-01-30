from django.contrib import admin

# Register your models here.
from crt.models import Team, Player, League, Competition, Match, Performance, BatPerformance, BowlPerformance, Point

admin.site.register(Team)
admin.site.register(Player)
admin.site.register(League)
admin.site.register(Competition)
admin.site.register(Match)
admin.site.register(Performance)
admin.site.register(BatPerformance)
admin.site.register(BowlPerformance)
admin.site.register(Point)
