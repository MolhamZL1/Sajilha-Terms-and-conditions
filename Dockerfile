FROM nginx:alpine

# خلي إعداد السيرفر مكانه الصحيح
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# انسخ ملفات الموقع (عدّل المسار إذا مو بالجذر)
COPY . /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

