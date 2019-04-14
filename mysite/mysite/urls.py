"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from home import views as home_views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home_views.home),
    path('login/', home_views.user_login),
    path('sp_signup/', home_views.sp_signup),
    path('user_signup/', home_views.user_signup),
    path('user_login/', home_views.user_login),
    path('profile/', home_views.profile),
    path('logout/', home_views.logout),
    path('request/', home_views.request),
    path('available_request/', home_views.available_request, name='available_request'),
    path('history/', home_views.history),
    path('post/<int:pk>/', home_views.sp_request, name='sp_request'),
    path('post1/<int:pk>/', home_views.request_details, name='request_details'),
                  # path('request_searching/', home_views.request_searching),
    path('searching_service_provider/', home_views.searching_service_provider),
    path('ongoing_request/', home_views.ongoing_request),
    path('del/<int:pk>/', home_views.delete_request, name="delete_request"),
    path('del1/<int:pk>/', home_views.decline_request, name="decline_request"),
   path('refresh_check/', home_views.refresh_check),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

