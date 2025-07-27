List<double> normalColorMatrix = <double>[
  1, 0, 0, 0, 0, // Red
  0, 1, 0, 0, 0, // Green
  0, 0, 1, 0, 0, // Blue
  0, 0, 0, 1, 0, // Alpha
];
List<double> invertGrayMatrix = <double>[
  -1, 0, 0, 0, 255, // Red
  0, -1, 0, 0, 255, // Green
  0, 0, -1, 0, 255, // Blue
  0, 0, 0, 1, 0, // Alpha
];

List<double> nightVisionMatrix = <double>[
  0.1, 0.6, 0.1, 0, 0, // Red channel suppressed
  0.1, 0.6, 0.1, 0, 80, // Green channel boosted (adds green tone)
  0.1, 0.6, 0.1, 0, 0, // Blue channel suppressed
  0, 0, 0, 1, 0, // Alpha unchanged
];