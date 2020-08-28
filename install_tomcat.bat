cd /home/vlad/myWebSites/webgrumpyfox/
git pull
mvn clean
mvn install
mvn compile war:war
cp /home/vlad/myWebSites/webgrumpyfox/deployments/webgrumpyfox.war /opt/tomcat/webapps/
rm -r -f META-INF/ static/ WEB-INF/
cp -rp /opt/tomcat/webapps/webgrumpyfox/* /opt/tomcat/webapps/ROOT/