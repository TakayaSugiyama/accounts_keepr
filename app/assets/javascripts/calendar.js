$(document).ready(function(){
  $('#calendar').fullCalendar({
    dayClick: function () {
      
    },
    lang: "ja",
    eventColor: '#378006',
    contentHeight: 'auto',
    eventSources:[
      {
        events: gon.records
      }
    ]
  });
});
