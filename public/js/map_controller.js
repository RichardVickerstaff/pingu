function makeHash(keys, value){
  var out = {};
  keys.forEach(function(key){
    out[key] = value;
  });
  return out;
}

var codesAfrica       = [ 'DZ', 'AO', 'BW', 'BI', 'CM', 'CV', 'CF', 'TD', 'KM', 'YT', 'CG', 'CD', 'BJ', 'GQ', 'ET', 'ER', 'DJ', 'GA', 'GM', 'GH', 'GN', 'CI', 'KE', 'LS', 'LR', 'LY', 'MG', 'MW', 'ML', 'MR', 'MU', 'MA', 'MZ', 'NA', 'NE', 'NG', 'GW', 'RE', 'RW', 'SH', 'ST', 'SN', 'SC', 'SL', 'SO', 'ZA', 'ZW', 'SS', 'EH', 'SD', 'SZ', 'TG', 'TN', 'UG', 'EG', 'TZ', 'BF', 'ZM' ];
var codesAsia         = [ 'AF', 'AZ', 'BH', 'BD', 'AM', 'BT', 'IO', 'BN', 'MM', 'KH', 'LK', 'CN', 'TW', 'CX', 'CC', 'CY', 'GE', 'PS', 'HK', 'IN', 'ID', 'IR', 'IQ', 'IL', 'JP', 'KZ', 'JO', 'KP', 'KR', 'KW', 'KG', 'LA', 'LB', 'MO', 'MY', 'MV', 'MN', 'OM', 'NP', 'PK', 'PH', 'TL', 'QA', 'RU', 'SA', 'SG', 'VN', 'SY', 'TJ', 'TH', 'AE', 'TR', 'TM', 'UZ', 'YE', 'XE', 'XD', 'XS' ];
var codesEurope       = [ 'AL', 'AD', 'AZ', 'AT', 'AM', 'BE', 'BA', 'BG', 'BY', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FO', 'FI', 'AX', 'FR', 'GE', 'DE', 'GI', 'GR', 'VA', 'HU', 'IS', 'IE', 'IT', 'KZ', 'LV', 'LI', 'LT', 'LU', 'MT', 'MC', 'MD', 'ME', 'NL', 'NO', 'PL', 'PT', 'RO', 'RU', 'SM', 'RS', 'SK', 'SI', 'ES', 'SJ', 'SE', 'CH', 'TR', 'UA', 'MK', 'GB', 'GG', 'JE', 'IM', 'XK' ];
var codesNorthAmerica = [ 'AG', 'BS', 'BB', 'BM', 'BZ', 'VG', 'CA', 'KY', 'CR', 'CU', 'DM', 'DO', 'SV', 'GL', 'GD', 'GP', 'GT', 'HT', 'HN', 'JM', 'MQ', 'MX', 'MS', 'AN', 'CW', 'AW', 'SX', 'BQ', 'NI', 'UM', 'PA', 'PR', 'BL', 'KN', 'AI', 'LC', 'MF', 'PM', 'VC', 'TT', 'TC', 'US', 'VI' ];
var codesOceania      = [ 'AS', 'AU', 'SB', 'CK', 'FJ', 'PF', 'KI', 'GU', 'NR', 'NC', 'VU', 'NZ', 'NU', 'NF', 'MP', 'UM', 'FM', 'MH', 'PW', 'PG', 'PN', 'TK', 'TO', 'TV', 'WF', 'WS', 'XX' ];
var codesSouthAmerica = [ 'AR', 'BO', 'BR', 'CL', 'CO', 'EC', 'FK', 'GF', 'GY', 'PY', 'PE', 'SR', 'UY', 'VE' ];

var pingsAfrica       = makeHash(codesAfrica, 90);
var pingsAsia         = makeHash(codesAsia, 70);
var pingsEurope       = makeHash(codesEurope, 20);
var pingsNorthAmerica = makeHash(codesNorthAmerica, 35);
var pingsOceania      = makeHash(codesOceania, 200);
var pingsSouthAmerica = makeHash(codesSouthAmerica, 400);
var pingsUK           = { "GB": 40};

var pingData = $.extend({}, pingsAfrica, pingsAsia, pingsEurope, pingsNorthAmerica, pingsOceania, pingsSouthAmerica, pingsUK);

common_series = {
  regions: [{
    values: pingData,
    scale: ['#00FF00', '#FFFF00'],
    normalizeFunction: 'polynomial'
  }]
};

$('#worldMap').vectorMap({ map: 'world_mill_en', series: common_series });
$('#euroMap').vectorMap({ map: 'europe_mill_en', series: common_series });
