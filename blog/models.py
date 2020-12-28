from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse

from matplotlib import pyplot as plt
from django_matplotlib import MatplotlibFigureField
import io 
import urllib, base64
from . import figures

class MyModel(models.Model):
    print('666')
    figure = MatplotlibFigureField(figure='my_figure')
    fig1 = models.TextField(default = "DUPA")
    #fig2 = models.TextField(default ='my_figure2')
    #fig2 = models.TextField(default ='my_figure2')
    fig2 = figures.my_figure2()
    #print(figure)
    #figure = models.TextField(figure='my_figure')
    # figure2 = 'xx'
    # print(figure)

    # def __init__():
    #     print('xxxx')

    # def _str_(self):
    #     print('xd')


def MakeChart2(size):
        plt.plot(range(size))
        fig = plt.gcf()
        #convert graph into dtring buffer and then we convert 64 bit code into image
        buf = io.BytesIO()
        fig.savefig(buf,format='png')
        buf.seek(0)
        string = base64.b64encode(buf.read())
        uri =  urllib.parse.quote(string)
        # print(uri)
        return uri

def MakeChart3(size):
        plt.plot(range(size))
        fig = plt.gcf()
        #convert graph into dtring buffer and then we convert 64 bit code into image
        buf = io.BytesIO()
        fig.savefig(buf,format='png')
        #print(buf)
        return buf


class Post(models.Model):
    #title = models.CharField(max_length=100)
    title = "HARDCODED TEST"
    #content = models.TextField()
    content = "HARDCODED TEST"
    substance = models.TextField(default = "woda")
    date_posted = models.DateTimeField(default=timezone.now)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    chart = MakeChart2(10)
    chart2 = MakeChart3(10)


    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('post-detail', kwargs={'pk': self.pk})

    