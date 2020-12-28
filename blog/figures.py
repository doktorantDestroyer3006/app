import matplotlib.pyplot as plt
import matplotlib.pyplot as plt
import io 
import urllib, base64
from django_matplotlib import MatplotlibFigureField

def my_figure():
	    fig, ax = plt.subplots()
	    ax.plot([1, 3, 4], [3, 2, 5])
	    
	    fig2, yx = plt.subplots()
	    yx.plot([1, 3, 4], [3, 2, 5])
	    buf = io.BytesIO()
	    fig2.savefig(buf,format='png')
	    buf.seek(0)
	    string = base64.b64encode(buf.read())
	    uri =  urllib.parse.quote(string)
	    return fig

def my_figure2():
	    fig, ax = plt.subplots()
	    ax.plot([1, 3, 4], [3, 2, 5])
	    
	    fig2, yx = plt.subplots()
	    yx.plot([1, 3, 4], [3, 2, 5])
	    buf = io.BytesIO()
	    fig2.savefig(buf,format='png')
	    buf.seek(0)
	    string = base64.b64encode(buf.read())
	    uri =  urllib.parse.quote(string)
	    return uri  


# def my_figure():
# 	fig, ax = plt.subplots()
#     ax.plot([1, 3, 4], [3, 2, 5])

#     	return fig
    
    #x = plt.plot(range(2))
    #fig2 = plt.gcf()
    #buf = io.BytesIO()
    #fig2.savefig(fig2,format='png')
    # buf.seek(0)
    # string = base64.b64encode(buf.read())
    # uri =  urllib.parse.quote(string)
    
#     return #fig

# def my_figure():
# 	print('test1xx')
# 	plt.plot(range(size))
#     fig = plt.gcf()
#     #convert graph into dtring buffer and then we convert 64 bit code into image
#     buf = io.BytesIO()
#     fig.savefig(buf,format='png')
#     buf.seek(0)
#     string = base64.b64encode(buf.read())
#     uri =  urllib.parse.quote(string)
#     return uri


# def MakeChart(size):
#     plt.plot(range(size))
#     fig = plt.gcf()
#     #convert graph into dtring buffer and then we convert 64 bit code into image
#     buf = io.BytesIO()
#     fig.savefig(buf,format='png')
#     buf.seek(0)
#     string = base64.b64encode(buf.read())
#     uri =  urllib.parse.quote(string)