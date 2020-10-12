pipeline {
    agent any
        triggers {
            //pollSCM('') //Empty quotes tells it to build on a push  
            githubPush()
        }
        stages {
            stage('Build') {
                steps {
                    echo 'This is the Build Stage'
                }
            }
            stage('Deploy') {
                steps {
                    echo 'This is the Deploy BBP Stage'
                    sh 'ssh bp000359@ela1.cscs.ch "mkdir -p ./bbp/" '
                    sh 'ssh bp000359@ela1.cscs.ch "rm -rf ./bbp/*" '
                    sh 'scp * bp000359@ela1.cscs.ch:~/bbp/'
                    sh 'ssh bp000359@ela1.cscs.ch "ls ~/bbp/ && cat ./bbp/execute_daint.sh && cat ./bbp/deploy_script.sh" '
                    sh 'ssh bp000359@ela1.cscs.ch "./bbp/execute_daint.sh" '
                }
            }
            stage('Test') {
                steps {
                    echo 'This is the Testing Stage'
                }
            }
        }
    }
