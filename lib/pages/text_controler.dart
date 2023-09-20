class AppStrings {
  static const String appBarTitle = 'AppBar Title';

  static const String firsMenu = 'feature1';
  static const String secondMenu = 'feature2';

  static const String symbolLabel = 'Symbol';
  static const String intervalLabel = 'Interval';
  static const String startTimeLabel = 'Start Time';
  static const String endTimeLabel = 'End Time';
  static const String limitLabel = 'Limit';

  static const String errorTitle = 'Ошибка';
  static const String errorMessagePrefix = 'Ошибка при выполнении запроса: ';
  static const String errorButton = 'ОК';
  static const String fetchDataerrorButton = 'Fetch Data';

  static const List<String> columnHeaders = [
    'Open time',
    'Open price',
    'High price',
    'Low price',
    'Close price',
    'Volume',
    'Close time',
    'Quote volume',
    'Number of trades',
    'Taker buy volume',
    'Taker buy quote volume',
  ];
}

List<String> intervalOptions = [
  '1s',
  '1m',
  '3m',
  '5m',
  '15m',
  '30m',
  '1h',
  '2h',
  '4h',
  '6h',
  '8h',
  '12h',
  '1d',
  '3d',
  '1w',
  '1M',
];
