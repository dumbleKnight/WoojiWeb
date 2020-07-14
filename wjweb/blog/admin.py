from django.contrib import admin

from .models import Blog, Comment, Tag
from django.utils.html import format_html
from django.utils.safestring import mark_safe

# Register your models here.

#@admin.register(Author)
#class AuthorAdmin(admin.ModelAdmin):
#    list_display = ['username','email', 'is_staff', 'is_premium', 'show_photo']
#    fields = ['username', 'email', ('first_name', 'last_name'), 'head_pic', 'show_photo', 'bio', \
#            'is_premium', 'is_staff', 'is_active', 'is_superuser',  ]
#    readonly_fields = ('show_photo', )

#    def show_photo(self, obj):
#        return mark_safe('<img src="{url}" width="100px" height="100px" />'.format(url = obj.head_pic.url))


@admin.register(Blog)
class BlogAdmin(admin.ModelAdmin):
    list_display = ['title', 'author', 'pub_time', 'update_time', 'is_draft']
    fields = ['title', ('author', 'pub_time', 'update_time'), 'is_draft', 'tag', 'summary', 'body']
    list_filter = ( 'author', 'tag', 'is_draft' )
    #readonly_fields = ('pub_time', )


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ('name', 'show_tag')
    fields = ('name', 'color', 'show_tag')
    readonly_fields = ('show_tag', )
    def show_tag(self, obj):
        return mark_safe('<h3><span style="background-color:{color};color:black;">{tag}</span></h3>'.format(color = obj.color, tag = obj.name))


@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ('time', 'author', 'blog')
    fields = [('time', 'author'), 'blog', 'content']
    list_filter = ['author', 'blog']





