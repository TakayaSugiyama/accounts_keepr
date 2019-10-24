$(document).ready(function(){
  $('#calendar').fullCalendar({
    dayClick: function () {
      
    },
    lang: "ja",
    eventColor: '#378006',
    eventSources:[
      {
        events: gon.records
      }
    ]
  });
});
