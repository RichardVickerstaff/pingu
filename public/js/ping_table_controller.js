$.getJSON( "/pings", function(data) {
  console.log(data);

  var rows = [];
  $.each( data, function(key, pings) {
    var row = '<tr>';
    row += '<td class="text-right">'    + key                              + '</td>';
    row += '<td class="uk">'            + pings.uk.average_ping            + '</td>';
    row += '<td class="eu">'            + pings.eu.average_ping            + '</td>';
    row += '<td class="north_america">' + pings.north_america.average_ping + '</td>';
    row += '<td class="south_america">' + pings.south_america.average_ping + '</td>';
    row += '<td class="asia">'          + pings.asia.average_ping          + '</td>';
    row += '<td class="oceania">'       + pings.oceania.average_ping       + '</td>';
    row += '<td class="africa">'        + pings.africa.average_ping        + '</td>';
    row += '</tr>';
    rows.push(row);
  });

  $("<tbody/>")
    .html(rows.join("\n"))
    .appendTo( "#ping_results" );
});
