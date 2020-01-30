from django.urls import path

from crt import views

app_name = 'crt'
urlpatterns = [
    path('', views.TeamTemplateView.as_view(), name='home_index'),
    path('team/<slug:pk>', views.TeamDetailView.as_view(), name='team-detail'),
    path('all-fixtures', views.AllFixturesView.as_view(), name='all-fixtures'),
    path('points/<slug:pk>', views.PointsDetailView.as_view(), name='points-table'),
]
