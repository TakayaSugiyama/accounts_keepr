$(document).ready(function(){
  $('#calendar').fullCalendar({
    dayClick: function () {
      
    },
    lang: "ja",
    eventColor: '#D7F0F7',
    eventSources:[
      {
        events: gon.records
      }
    ] 
  });
});
