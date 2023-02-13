#FROM nvcr.io/nvidia/l4t-tensorflow:r32.6.1-tf2.5-py3


FROM nvcr.io/nvidia/l4t-tensorflow:r32.6.1-tf2.5-py3


RUN mkdir -p /home/${GetMyUsername}/cam2bev/
WORKDIR /home/${GetMyUsername}/cam2bev/
COPY . .
ENV TZ=Asia/Kolkata
RUN ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime
RUN echo "$TZ" > /etc/timezone
RUN apt-get update
RUN apt-get install -y python3-opencv

COPY requirements.txt /home/${GetMyUsername}/cam2bev/requirements.txt
RUN pip3 install -r /home/${GetMyUsername}/cam2bev/requirements.txt

#command that runs when container starts 
CMD ["python3", "./data/download.sh"]
CMD ["python3", "./model/train.py"]
