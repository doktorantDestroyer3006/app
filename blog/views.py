from django.shortcuts import render
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)
from .models import Post
from .models import MyModel

from matplotlib import pyplot as plt
import io 
import urllib, base64 

#To ponizej w ogole nic nie robi bo MODELS to nadpisuje,
#albo prowadzi w ogole do nie uzycia.
#Obkomentowalem i nie bylo widac roznicy. Mozna usunac kiedys chyba,
#ale sie musze upewnic.
def home(request):
    context = {
        'posts': Post.objects.all(),
        'charts': MyModel.objects.all()
    }
    print('lol1')
    context['charts']._str_()
    print('lol2')
    return render(request, 'blog/home.html', context)


#to chyba to wyzej nadpisuje w dzialaniu appki
# class PostListView(ListView):
#     model = Post
#     template_name = 'blog/home.html'  # <app>/<model>_<viewtype>.html
#     context_object_name = 'posts'
#     ordering = ['-date_posted']

class PostListView(ListView):
    model = MyModel
    template_name = 'blog/home.html'  # <app>/<model>_<viewtype>.html
    context_object_name = 'charts'
    #ordering = ['-date_posted']


class PostDetailView(DetailView):
    model = Post


class PostCreateView(LoginRequiredMixin, CreateView):
    model = Post
    fields = ['title', 'content', 'substance']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)


class PostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Post
    fields = ['title', 'content', 'substance']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False


class PostDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Post
    success_url = '/'

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False


def about(request):
    chart = MakeChart(10)
    context = {
         'charts': chart
      }
    
    return render(request, 'blog/about.html', context
        #, {'title': 'About'}
        )

#ta metoda dziala i poprawnie rzuca do about chart z pyplot
def MakeChart(size):
    plt.plot(range(size))
    fig = plt.gcf()
    #convert graph into dtring buffer and then we convert 64 bit code into image
    buf = io.BytesIO()
    fig.savefig(buf,format='png')
    buf.seek(0)
    string = base64.b64encode(buf.read())
    uri =  urllib.parse.quote(string)
    
    return uri