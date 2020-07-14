from django import forms
from django.contrib.auth.models import User

#from .models import UserProfile
from .models import CustomUser
from django.contrib.auth.forms import UserCreationForm, UserChangeForm


class RegistrationForm(forms.ModelForm):
    email = forms.EmailField(max_length=200, help_text='Required')
    password = forms.CharField(label='Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Confirm password', widget=forms.PasswordInput)

    class Meta:
        model = CustomUser
        fields = ('username','email',) 

    def clean_password2(self):
        cd = self.cleaned_data
        if cd['password'] != cd['password2']:
            raise forms.ValidationError('Passwords don\'t match.')
        return cd['password2']

    def clean_email(self):
        email = self.cleaned_data['email']
        if CustomUser.objects.filter(email=email).exists():
            raise forms.ValidationError('This Email has already been taken. Please use another Email.')
        return email


from django.utils.safestring import mark_safe
#class PictureWidget(forms.widgets.Widget):
#    def render(self, name, value, attrs=None):
#        html =  Template("""<img src="$link" width="150px" height="150px" />""")
#        return mark_safe(html.substitute(link=value)

class UserForm(forms.ModelForm):
    #head_pic = ImageField(widget=PictureWidget)
    class Meta:
        model = CustomUser
        fields = ['email', 'first_name', 'last_name', 'head_pic', 'bio', 'is_premium']
    email = forms.CharField(widget=forms.TextInput(attrs={'readonly':'readonly'}))
    #fields['email'].disabled = True

    #def show_head_pic(self, obj):
    #    return mark_safe('<img src="{url}" width="150px" height="150px" />'.format(url = obj.head_pic.url))

#class ProfileForm(forms.ModelForm):
#    class Meta:
#        model = UserProfile
#        fields = ('head_pic', 'bio')


#class CustomUserCreationForm(UserCreationForm):

#    class Meta(UserCreationForm):
#        model = CustomUser
#        fields = ('username', 'email')


#class CustomUserChangeForm(UserChangeForm):

#    class Meta:
#        model = CustomUser
#        fields = ('username', 'email')


