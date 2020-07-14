from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from django.conf import settings
from django.contrib.auth import login
from django.contrib.auth.models import User

from .models import CustomUser
from .forms import RegistrationForm, UserForm
from .tokens import account_activation_token
from django.contrib.auth.decorators import login_required
from django.db import transaction

from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.generic import UpdateView, ListView
from django import forms


def accounts_register(request):
    if request.method == 'POST':
        registerForm = RegistrationForm(request.POST)
        if registerForm.is_valid():
            user = registerForm.save(commit=False)
            user.email = registerForm.cleaned_data['email']
            user.set_password(registerForm.cleaned_data['password'])
            user.is_active = False
            # Save the User object
            user.save()

            # get current site
            current_site = get_current_site(request)
            subject = 'Activate your Account'
            # create Message
            message = render_to_string('accounts/account_activation_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            # send activation link to the user
            user.email_user(subject=subject, message=message)
            return HttpResponse('Registered succesfully! Please check your email for the activation link.')   
    else:
        registerForm = RegistrationForm()
    return render(request, 'accounts/register.html',{'form': registerForm})


def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = CustomUser.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, CustomUser.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        login(request, user)
        return redirect('home')
    else:
        return render(request, 'accounts/account_activation_invalid.html')

def myprofile(request):
    if request.user.is_authenticated:
        profile = { 'username': request.user.get_username, 
                'email': request.user.email, 
                'photo': request.user.head_pic, 
                'bio': request.user.bio }
        return render(request, 'accounts/myprofile.html', profile)
    else:
        return redirect('login')

#@method_decorator(login_required, name='dispatch')
class UpdateProfile(UpdateView):
    #model = CustomUser
    form_class = UserForm
    #fields = ['first_name', 'last_name', 'head_pic', 'bio', 'is_premium'] # Keep listing whatever fields
    template_name = 'accounts/my_account.html'
    success_url = reverse_lazy('my_account')

    def get_object(self):
        return self.request.user


    #template_name_suffix = '_profile_update'
    # the combined UserProfile and User exposes.
    #template_name = 'accounts/myprofile.html'
    #slug_field = 'username'
    #slug_url_kwarg = 'slug'




'''
@login_required
@transaction.atomic
def update_profile(request):
    if request.method == 'POST':
        user_form = UserForm(request.POST, instance=request.user)
        profile_form = ProfileForm(request.POST, instance=request.user.userprofile)
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            messages.success(request, _('Your profile was successfully updated!'))
            return redirect('settings:profile')
        else:
            messages.error(request, _('Please correct the error below.'))
    else:
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.userprofile)
    return render(request, 'accounts/userprofile.html', {
        'user_form': user_form,
        'profile_form': profile_form
    })

'''
