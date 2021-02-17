cd /home/vlad/myWebSites/webgrumpyfox/
git pull
echo "$(tput setaf 2)Pull ready$(tput setab 7)$(tput sgr 0)"

mvn clean
mvn install
mvn compile war:war
echo "$(tput setaf 2)Maven ready$(tput setab 7)$(tput sgr 0)"

cp /home/vlad/myWebSites/webgrumpyfox/deployments/webgrumpyfox.war /opt/tomcat/webapps/
cd /opt/tomcat/webapps/ROOT/
rm -r -f META-INF/ static/ WEB-INF/
cp -rp /opt/tomcat/webapps/webgrumpyfox/* /opt/tomcat/webapps/ROOT/
echo "$(tput setaf 2)Update ready$(tput setab 7)$(tput sgr 0)"