Project: NodeJs 

Devops tools:

1. Git 
2. GitHub
3. jenkins 
4. sonarqube
5. docker 

Infrastrctue tools: 

1. aws
2. terraform  


==============================================================================================================


pre-requisites:


1. install git/gitbash on your window or mac 
2. install visual studio 
3. mobaxterm if you are using windows
4. aws cli (create a IAM user in aws account with Admin access)
5. terraform 


terraform on mac:
`````````````````

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew update
brew upgrade hashicorp/tap/terraform
terraform -help



================================================================================

Jenkin Configuration:

1. access the jenkins app

    http://34.235.159.194:8080/ (server public ip )


2. follow the instructions to complete the jenkins setup

3. change the admin default password 

     . login the jenkin app

     . go to admin -> security -> update your password under password and confirm password 


required plugins for this project:

1. eclipse temurin - (when you are using differen java versions)

2. pipeline: stage view - (to see the stage wise execution pipeline)

3. sonarqube scanner  - (scan the code)

4. nodejs

5. owasp dependency-check 

6. docker pipeline 




Configure tools:


1. JDK Installation

      Name: jdk17 (this name should be same as in Jenkinsfile)
      Install automatically: Install from adoptium.net
      version: jdk-17.0.11+9

2. SonarQube Scanner installations

      Name: sonar-scanner (this name should be same as in Jenkinsfile)
      Install automatically: Install from Maven Central
      version: keep the selected version

3. NodeJS installations 

      Name: node23 (this name should be same as in Jenkinsfile)
      Install automatically: Install from nodejs.org
      version: keep the selected version
     

4. Docker installations

      Name: docker (this name should be same as in Jenkinsfile)
      Install automatically: Install from Download from docker.com
      version: latest


5. Dependency-Check installations

      Name: DP-Check (this name should be same as in Jenkinsfile)
      Install automatically: Install from github.com
      version: keep the selected version



configure sonareqube credentials:(check step 2 below in SonarQube configuraion)


    Dashboard -> manage jenkins -> credentials -> global -> add credentials

     Kind: secret text 
     
     secret: 

     id: sonar-token (this name should be same as in Jenkinsfile)



configure sonarqube system:


   Dashboard -> manage jenkins -> system -> SonarQube servers

   name: sonar-server
   Server URL: sonarqube server url 
   Server authentication token: select the we create in the above step 



Configure Docker credentials:


    Dashboard -> manage jenkins -> credentials -> global -> add credentials

     Kind: username and password 
     
     username:
     
     password:

     id: docker-creds (this name should be same as in Jenkinsfile)



=============================================================================================

SonarQube configuraion:

1. access the jenkins app

    http://34.235.159.194:9000/ (server public ip )

  default username: admin 
          password: admin 

  Note: we need to change the passwod          


2. generate a token for admin user to access the sonarqube server from jenkins 

    
    adminstration -> security -> users -> update tokens -> generate token 

    squ_b6c32b651690046c56c9eae4765a784931bc9cbd


3. Generate webhook 

     
     adminstration  -> configuraion -> webhooks -> create 

     name: jenkins 
     http://54.152.130.97:8080/sonarqube-webhook/

      here the ip is jenkins server


================================================

Create a Jenkins pipeline job


===========================================================

Access the application:  http://54.152.130.97:3000



========================
    


