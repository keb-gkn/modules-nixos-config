function discord
  set -g discord_path "/home/arthank/.discord/"
  set -g download_path "/home/arthank/.discord/download/"
  set -g app_path "/home/arthank/.discord/app/"

  if test $argv[1] = "update"
    cd $download_path
    echo $PWD
    curl "https://discord.com/api/download/stable?platform=linux&format=tar.gz" > /home/arthank/.discord/download/dl_page
    python -c 'import requests
from html.parser import HTMLParser
f = open("/home/arthank/.discord/download/dl_page")
to_scan = f.read()
f.close()

class MyHTMLParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        if tag == "a":
          for attr in attrs:
            k, url = attr
            if k == "href":
                target_path = "/home/arthank/.discord/download/discord.tar.gz"
                
                res = requests.get(url, stream=True)
                if res.status_code == 200:
                    with open(target_path, "wb") as w:
                        w.write(res.raw.read())
                else:
                    print("Failed to download tarball")

parser = MyHTMLParser()
parser.feed(to_scan)'
    if test -e discord.tar.gz
      tar -xf discord.tar.gz
      rm -rf $app_path/*
      cp -r $download_path/Discord/* $app_path/
      rm -rf $download_path/*
      chmod +x $app_path/Discord
    end
  end

  cd $app_path
  ./Discord
end
