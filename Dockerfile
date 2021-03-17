FROM ubuntu:20.04
ARG CACHEBUST=1
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip\
    ffmpeg\
    python3\
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /youtube-downloader && mkdir -p /config && mkdir -p /video 
WORKDIR /youtube-downloader
ADD https://github.com/yt-dlp/yt-dlp/releases/download/2021.03.15/yt-dlp /bin
ADD https://raw.githubusercontent.com/cpulab/youtube-downloader/master/youtube-downloader.sh /youtube-downloader
RUN chmod +x /youtube-downloader/youtube-downloader.sh && chmod +x /bin/yt-dlp
VOLUME ["/config","/video"]
#CMD ./autoindex -d /database/db -r /data -i $refresh -cachedl