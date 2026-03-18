FROM mediawiki:1.45

# Copy extensions
ADD https://github.com/StarCitizenWiki/mediawiki-extensions-EmbedVideo.git /var/www/html/extensions/EmbedVideo
ADD https://github.com/Markus-Rost/InterwikiDispatcher.git /var/www/html/extensions/InterwikiDispatcher
ADD https://github.com/wikimedia/mediawiki-extensions-Loops.git#REL1_45 /var/www/html/extensions/Loops
ADD https://github.com/wikimedia/mediawiki-extensions-MobileDetect.git#REL1_45 /var/www/html/extensions/MobileDetect
ADD https://github.com/wikimedia/mediawiki-extensions-Poem.git#REL1_45 /var/www/html/extensions/Poem
ADD https://github.com/wikimedia/mediawiki-extensions-Scribunto.git#REL1_45 /var/www/html/extensions/Scribunto
ADD https://github.com/StarCitizenTools/mediawiki-extensions-TabberNeue.git /var/www/html/extensions/TabberNeue
ADD https://github.com/octfx/mediawiki-extensions-TemplateStylesExtender.git /var/www/html/extensions/TemplateStylesExtender
ADD https://github.com/wikimedia/mediawiki-extensions-Variables.git#REL1_45 /var/www/html/extensions/Variables
ADD https://github.com/Liquipedia/VariablesLua.git /var/www/html/extensions/VariablesLua

# Environment variables
ENV MW_SITE_SERVER=https://localhost
ENV PHP_UPLOAD_MAX_FILESIZE=20M
ENV PHP_POST_MAX_SIZE=20M
ENV PHP_MAX_INPUT_VARS=2000

# Expose port 80 on HTTP
EXPOSE 80/tcp