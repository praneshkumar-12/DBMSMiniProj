from django.urls import path

from . import views

urlpatterns = [
    path("", views.search_for_trains, name="blank"),
    path("app/admin/", views.homepage, name="homepage"),
    path("login/", views.login, name="login"),
    path("app/search_trains/", views.search_for_trains, name="search_for_trains"),
    path("app/show_route/<route_details>/", views.display_route, name="display_route"),
    path("app/all_trains/", views.show_all_trains, name="show_all_trains"),
    path("app/cancelled_trains/", views.cancelled_trains, name="cancelled_trains"),
    path("app/admin/edit_stations/", views.edit_stations, name="edit_stations"),
    path("app/admin/edit_trains/", views.edit_trains, name="edit_trains"),
    path("app/admin/edit_schedules/", views.edit_schedules, name="edit_schedules"),
    path("app/admin/edit_tickets/", views.edit_tickets, name="edit_tickets"),
    path("app/admin/cancel_trains/", views.cancel_trains, name="cancel_trains"),
]
