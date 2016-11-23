#Check if moodle-android exists
if [ -d "../../moodle-android" ]; then
    
    #Backup git files
    cp ../../moodle-android/.gitignore ../../.gitignore;
    cp ../../moodle-android/.gitattributes ../../.gitattributes;
    cp -r ../../moodle-android/.git ../../.git;
    
    echo "Files backed up!";

    #Remove existng moodle-android project
    rm -rf ../../moodle-android/*;
    
    echo "Files removed!";
    
    #Copy new project files
    cp -r ../www/* ../../moodle-android/;
    cp -r ../resources ../../moodle-android/resources;
    
    echo "New files copied!";
    
    cp -f ../../moodle-android/resources/splash.png ../../moodle-android/splash.png;
    cp -f ../../moodle-android/resources/icon.png ../../moodle-android/icon.png;
    
    #Restore git files
    echo "Restoring backup . . .";
    
    cp -f ../../.gitignore ../../moodle-android/.gitignore;
    cp -f ../../.gitattributes ../../moodle-android/.gitattributes;
    cp -rf ../../.git ../../moodle-android/.git;
    
    echo "Backup restored!";
    
    #Remove backup files
    rm -f ../../.gitignore;
    rm -f ../../.gitattributes;
    rm -rf ../../.git
    
    echo "Backup removed";
    
else
    
    #Create folder
    mkdir ../../moodle-android;
    
    echo "Created directory 'moodle-android'";
    
    #Copy new project files
    cp -r ../www/* ../../moodle-android/;
    cp -r ../resources ../../moodle-android/resources;
    
    echo "New files copied!";
    
    cp -f ../../moodle-android/resources/splash.png ../../moodle-android/splash.png;
    cp -f ../../moodle-android/resources/icon.png ../../moodle-android/icon.png;
    
fi

#Edit the required files
sed -i -e 's/<application android:debuggable="true" \/>/<application android:debuggable="false" \/>/g' ../../moodle-android/config.xml
sed -i -e "s/.constant('mmCoreLogEnabledDefault', true)/.constant('mmCoreLogEnabledDefault', false)/g" ../../moodle-android/core/lib/log.js
sed -i -e 's/<body ng-app="mm">/<body ng-app="mm" class="platform-android platform-cordova platform-webview">/g' ../../moodle-android/index.html

