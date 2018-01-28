({
    doInit : function(component, event, helper) {
        console.log('initialized');
        alert('init');
    },
    jsLoaded : function(component, event, helper) {
        console.log('loaded js');
        alert('loaded js');
    }
})
