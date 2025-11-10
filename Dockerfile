FROM nginx:alpine

# استبدال إعداد الموقع
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# ⚠️ انسخ كل شي من الجذر (عدّل لو ملفاتك بمجلد آخر)
COPY . /usr/share/nginx/html/

# ملفات تشخيص نقدر نفتحها بالمتصفح
RUN sh -c "echo 'Build UTC: ' $(date -u +%Y-%m-%dT%H:%M:%SZ) > /usr/share/nginx/html/__build.txt" \
 && sh -c "ls -la /usr/share/nginx/html > /usr/share/nginx/html/__ls.txt"

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

