server {

        root /var/www/lt-2021-053.ml/html;
        index index.html index.htm index.nginx-debian.html;

        server_name lt-2021-053.ml www.lt-2021-053.ml;

        location / {
		proxy_pass http://127.0.0.1:8081;
        }
	
	location = /web0053 {
		default_type text/html;
		return 200 '<!DOCTYPE html><h2>LT-2021-053</h2>';
	}

	location = /secret {
		# alias /var/www/lt-2021-053.ml/html/secret/;
		try_files $uri /wso2;
		auth_basic "admin area";
		auth_basic_user_file /etc/nginx/.htpasswd;
		alias /var/www/lt-2021-053.ml/html/secret/;
		# default_type text/html;
		# return 200 '<!DOCTYPE html><h6>You are authenticated</h6>';
	}
	
	location = /wso2 {
		default_type text/html;
		return 200 '<!DOCTYPE html><h2>Authenticated</h2>';
	}
	
    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/lt-2021-053.ml/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/lt-2021-053.ml/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}
server {
    if ($host = www.lt-2021-053.ml) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = lt-2021-053.ml) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


        listen 80;
        listen [::]:80;

        server_name lt-2021-053.ml www.lt-2021-053.ml;
    return 404; # managed by Certbot




}
