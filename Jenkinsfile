pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Starting Jenkins Build..."
                // powershell "& .\\build.ps1 -debug -clean"
                // powershell '$p = (Get-Location).path; write-output "Testing:  ${p}"'
                // archiveArtifacts artifacts: 'build/output/**', fingerprint: true, followSymlinks: false
            }
        }
        stage('Test') {
            steps {
                echo "Starting Jenkins Test..."
                /* powershell 'Write-Output "Starting Jenkins Test..."' */
            }
        }
        stage('Deployment') {
            steps {
                echo "Deploying to 'LOCATION'..."
                //powershell "& .\\deploy.ps1"
                
            }
        }
    }
}