from django import forms
from ckeditor.widgets import CKEditorWidget
from ckeditor_uploader.widgets import CKEditorUploadingWidget

from .models import Blog, Comment, Tag

class BlogForm(forms.ModelForm):
    body = forms.CharField(widget = CKEditorUploadingWidget())
    class Meta:
        model = Blog
        fields = ('title', 'tag', 'body')

class DeleteNewForm(forms.ModelForm):
    class Meta:
        model = Blog
        fields = []

