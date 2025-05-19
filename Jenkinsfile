pipeline{
    
    agent {label "prd"}
    
    stages{
        stage("Code Clone"){
            steps{
               git url: "https://github.com/abhihkX8/two-tier-flask-app.git", branch: "dev"
            }
        }
        stage("Build"){
            steps{
                sh "docker build -t two-tier-flask-app ."
            }
            
        }
        
       
        stage("Deploy"){
            steps{
                sh "docker compose down && docker compose up -d"
            }
        }
    }
    
}
