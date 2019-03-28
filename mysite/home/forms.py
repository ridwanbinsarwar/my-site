from django import forms
from .models import Users, ServiceProvider


class UserLogin(forms.ModelForm):
    class Meta:
        model = Users
        fields = ('user_email', 'user_password')


class NewServiceProvider(forms.ModelForm):
    re_password = forms.CharField()

    class Meta:
        model = ServiceProvider
        fields = ['id', 'password', 're_password']

    def clean_password(self):
        temp_repass = self.cleaned_data.get('re_password')
        temp_pass = self.cleaned_data.get('password')
        if temp_pass != temp_repass:
            raise forms.ValidationError("The password does not match")
        return temp_pass
