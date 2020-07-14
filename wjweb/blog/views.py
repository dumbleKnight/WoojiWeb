from django.shortcuts import render, redirect, get_object_or_404

# Create your views here.
from .models import *
from .forms import BlogForm, DeleteNewForm
import markdown
from django.core.paginator import Paginator
from django.http import HttpResponse

from datetime import datetime
from django.apps import apps

usermodel = apps.get_model('accounts', 'CustomUser')

def blogindex(request):
    if request.method == 'GET':
        blog_list = Blog.objects.filter(is_draft=False).order_by('-pub_time')
        paginator = Paginator(blog_list, 7)
        page = request.GET.get('page')
        blogs = paginator.get_page(page)
        return render(request, 'blogindex.html', {'blogs': blogs})
    else:
        blog_list = Blog.objects.filter(author_id=int(request.POST['author_id']), is_draft=False).order_by('-pub_time')
        if len(blog_list) > 0:
            author_name = blog_list[0].author.username
        else:
            author_name = 'None'
        paginator = Paginator(blog_list, 7)
        page = request.POST.get('page')
        blogs = paginator.get_page(page)
        return render(request, 'bloglist_by_author.html', {'blogs': blogs, 'author_name':author_name})

        
def mypostsview(request):
    if request.method == 'POST':
        delete = get_object_or_404(Blog, id=request.POST['blog_id'])
        form = DeleteNewForm(request.POST, instance = delete)
        if form.is_valid():
            delete.delete()
            
    blog_list = Blog.objects.filter(author_id=request.user.id, is_draft=False).order_by('-pub_time')
    paginator = Paginator(blog_list, 7)
    page = request.GET.get('page')
    blogs = paginator.get_page(page)
    return render(request, 'myposts.html', {'blogs': blogs})


def mydraftsview(request):
    if request.method == 'POST':
        delete = get_object_or_404(Blog, id=request.POST['blog_id'])
        form = DeleteNewForm(request.POST, instance = delete)
        if form.is_valid():
            delete.delete()

    blog_list = Blog.objects.filter(author_id=request.user.id, is_draft=True).order_by('-update_time')
    paginator = Paginator(blog_list, 7)
    page = request.GET.get('page')
    blogs = paginator.get_page(page)
    return render(request, 'mydrafts.html', {'blogs': blogs})


def blogdetail(request, pk):
    blog = Blog.objects.get(id = int(pk))
    blog.body = markdown.markdown(
        blog.body,
        extensions=[
            'markdown.extensions.extra',
            'markdown.extensions.toc',
            'markdown.extensions.codehilite',
        ]
    )
    return render(request, 'blogdetail.html', {'blog': blog, 'comments':blog.comments.all().order_by('-time'), 'ncomment':len(blog.comments.all())})


def update_blog(request, pk):
    if request.user.is_authenticated:
        user_name = request.user.get_username() 
        #blog = Blog.objects.get(id = int(pk))
        instance = get_object_or_404(Blog, id=int(pk))
        blog_author = instance.author.get_username()

        if user_name == blog_author:
            if request.method == "POST":
                form = BlogForm(request.POST, instance=instance)
                if form.is_valid():
                    blog = form.save(commit = False)
                    blog.author = request.user
                    if 'save_to_draft' in request.POST:
                        blog.update_time = datetime.now()
                        blog.is_draft = True
                    else:
                        blog.pub_time = datetime.now()
                        blog.is_draft = False
                    blog.save()
                    if blog.is_draft:
                        return redirect("blog:mydrafts")
                    else: 
                        return redirect("blog:myposts")
                else:
                    return HttpResponse('Invalid form!')
            else:
                return render(request, "update_blog.html", {"form": BlogForm(instance=instance)})
        else:
            info = "You are NOT the author of this blog!"
            return render(request, "blog_user_mismatch.html", {'info': info})
    else:
        return redirect('login')


def create_blog(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            form = BlogForm(request.POST)
            if form.is_valid():
                blog = form.save(commit=False)
                blog.author = request.user
                if 'save_to_draft' in request.POST:
                    blog.update_time = datetime.now()
                    blog.is_draft = True
                else:
                    blog.pub_time = datetime.now()
                    blog.is_draft = False
                
                blog.save()
                if blog.is_draft:
                    return redirect("blog:mydrafts")
                else: 
                    return redirect("blog:myposts")
            else:
                return HttpResponse('Invalid form!')
        else:
            return render(request, "create_blog.html", {"form": BlogForm()})
    else:
        return redirect('login')

