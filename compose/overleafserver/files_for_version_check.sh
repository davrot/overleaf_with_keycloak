# escape
docker exec -it overleafserver bash -ce "mkdir -p /var/lib/overleaf/to_mod/escape"
find escape -type f | sed s/"escape"/"\/overleaf\/services\/clsi\/app\/js"/g | awk '{print "docker exec -it overleafserver bash -ce \"cp " $1 " /var/lib/overleaf/to_mod/escape \""}' > todo_files.sh
## openid
docker exec -it overleafserver bash -ce "mkdir -p /var/lib/overleaf/to_mod/openid"
find openid -type f | sed s/"openid"/"\/overleaf"/g | awk '{print "docker exec -it overleafserver bash -ce \"cp " $1 " /var/lib/overleaf/to_mod/openid/ \""}' >> todo_files.sh
## track
docker exec -it overleafserver bash -ce "mkdir -p /var/lib/overleaf/to_mod/track"
find track -type f | sed s/"track"/"\/overleaf\/services"/g | awk '{print "docker exec -it overleafserver bash -ce \"cp " $1 " /var/lib/overleaf/to_mod/track/ \""}' >> todo_files.sh
