# syntax=docker/dockerfile:1
#
ARG IMAGEBASE=frommakefile
#
FROM ${IMAGEBASE}
#
RUN set -xe \
# uninstall openjdk non-runtime packages
	&& apk del --purge .deps-devel \
	&& apk add --no-cache --purge -uU \
# required base xorg and audio packages
		alsa-plugins-pulse \
		alsa-utils \
		dbus-x11 \
		ffmpeg-libs \
		icu-libs \
		iso-codes \
		libgcc \
		linux-firmware-i915 \
		mesa-dri-gallium \
		mesa-gl \
		mesa-va-gallium \
		mesa-vulkan-swrast \
		musl \
		pulseaudio \
		udev \
		unzip \
		zlib-dev \
# fonts
		font-anonymous-pro-nerd \
		ttf-cantarell \
		ttf-dejavu \
		ttf-droid \
		ttf-font-awesome \
		ttf-freefont \
		ttf-hack \
		ttf-inconsolata \
		ttf-liberation \
		ttf-linux-libertine \
		ttf-mononoki \
		ttf-opensans \
# libreoffice packages
		libreoffice \
		libreoffice-base \
		libreoffice-calc \
		libreoffice-draw \
		libreoffice-impress \
		libreoffice-math \
		libreoffice-writer \
		libreofficekit \
		libreoffice-connector-postgres \
		libreoffice-lang-en_gb \
		libreoffice-lang-en_us \
		libreoffice-lang-uk \
	&& rm -rf /var/cache/apk/* /tmp/*
#
COPY root/ /
#
VOLUME /home/${S6_USER:-alpine}/ /home/${S6_USER:-alpine}/Documents/
#
# WORKDIR /home/${S6_USER:-alpine}/
#
ENTRYPOINT ["/usershell"]
CMD ["/usr/bin/libreoffice"]
