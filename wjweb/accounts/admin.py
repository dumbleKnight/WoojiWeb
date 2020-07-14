
from django.contrib import admin
#from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin

#from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import CustomUser
from django.utils.translation import ugettext_lazy as _
from django.utils.html import format_html
from django.utils.safestring import mark_safe


#admin.site.register(CustomUser)
#class CustomUserAdmin(UserAdmin):
#    add_form = CustomUserCreationForm
#    form = CustomUserChangeForm
#    model = CustomUser
#    list_display = ['username', 'email']
#admin.register(CustomUserAdmin)

@admin.register(CustomUser)
class CustomUserAdmin(UserAdmin):
    list_display = ('username', 'email', 'is_active', 'is_staff', 'is_superuser', 'is_premium', 'show_photo')
    list_filter = ('is_active', 'is_staff', 'is_premium', 'is_superuser')

    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        (_('Personal info'), {'fields': (('first_name', 'last_name'), ('email', 'is_premium'), 'head_pic', 'bio')}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}), 
        )

    search_fields = ('username', 'first_name', 'last_name', 'email')

    def show_photo(self, obj):
        return mark_safe('<img src="{url}" width="70px" height="70px" />'.format(url = obj.head_pic.url))

#admin.site.register(CustomUser, CustomUserAdmin)
