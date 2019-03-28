from django.contrib.auth.models import User
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect

# Create your views here.
from .forms import UserLogin, NewServiceProvider


def home(request):
    return render(request, 'sheba/home.html', {})


def user_login(request):

    return render(request, 'sheba/login.html', {})


def user_signup(request):
    if request.method == "POST":
        form = NewServiceProvider(request.POST)
        if form.is_valid():
            print("valid")
            post = form.save(commit=False)
            post.save()
        else:
            print("not valid")
    else:
        form = NewServiceProvider()

    return render(request, 'sheba/signup.html', {'form': form})


def check_email_password(request):
    pk = request.POST["user_email"]
    password = request.POST["user_password"]
    found = False
    user_check = User.objects.raw(
        'SELECT user_email AS id, user_password, user_type FROM users WHERE user_email=%s AND user_password=%s',
        [pk, password])
    for i in user_check:
        found = True
    if found:
        print("SUCCESSFUL")
    else:
        print("FAILED")
    return render(request, 'sheba/login.html', {"valid": found})


