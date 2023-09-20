class KlineData {
  const KlineData({
    required this.klineOpenTime,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.closePrice,
    required this.volume,
    required this.klineCloseTime,
    required this.quoteAssetVolume,
    required this.numberOfTrades,
    required this.takerBuyBaseAssetVolume,
    required this.takerBuyQuoteAssetVolume,
  });

  final int klineOpenTime;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double closePrice;
  final double volume;
  final int klineCloseTime;
  final double quoteAssetVolume;
  final int numberOfTrades;
  final double takerBuyBaseAssetVolume;
  final double takerBuyQuoteAssetVolume;
}
