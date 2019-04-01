from django import forms


from .models import Users, ServiceProvider, Customer


class UserLogin(forms.ModelForm):
    class Meta:
        model = Users
        fields = ('user_email', 'user_password')


class NewServiceProvider(forms.ModelForm):
    re_password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = ServiceProvider
        fields = ['id', 'password', 're_password']

    def clean_re_password(self):
        temp_repass = self.cleaned_data.get('re_password')
        temp_pass = self.cleaned_data.get('password')

        if temp_pass != temp_repass:
            raise forms.ValidationError("The password does not match")
        return temp_pass


class NewUser(forms.ModelForm):
    re_password = forms.CharField(max_length=30)

    class Meta:
        model = Customer
        fields = ['id', 'password']

    def clean_re_password(self):
        temp_repass = self.cleaned_data.get('re_password')
        temp_pass = self.cleaned_data.get('password')

        if temp_pass != temp_repass:
            raise forms.ValidationError("The password does not match")
        return temp_pass


class ServiceProviderProfile(forms.ModelForm):

    class Meta:
        model = ServiceProvider
        fields = ['first_name', 'last_name', 'contact_no', 'city', 'email']


class CustomerProfile(forms.ModelForm):

    class Meta:
        model = Customer
        fields = ['first_name', 'last_name', 'contact_no', 'city', 'email']
