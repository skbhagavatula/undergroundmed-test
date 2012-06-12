class VideoAttributes

  MEDICINE = "Medicine"
  SURGERY = "Surgery"
  ANESTHESIA = "Anesthesia"
  RADIOLOGY = "Radiology"
  PEDIATRICS = "Pediatrics"
  OBGYN = "Ob/gyn"
  OTHER = "Other"

  @categories_by_id =  {
    '5uBE4uuTEMQ' => MEDICINE,
    'ta9KNbcq-KI' => MEDICINE,
    'T3xFzsgJBkU' => MEDICINE,
    '4fP7-XgSZnQ' => MEDICINE,
    'yoJzNL6XqkI' => MEDICINE,
    'wAMis_HNZWE' => MEDICINE,
    '3CyKCe8B894 ' => MEDICINE,
    'nopHyyI2vPY' => MEDICINE,
    'jzVBNyI9Ay8' => MEDICINE,
    'VACDx6QTJv4' => MEDICINE,
    '7w3F-U6j1yU' => MEDICINE,
    '63tXOFlDQS8' => MEDICINE,
    'A_lrwKVLNNE' => MEDICINE,
    'uRk6XVw4pnw' => MEDICINE,
    'WF1s01ePXLI' => MEDICINE,
    'y5TZT1IaQns' => MEDICINE,
    'H-pajljT5qE' => MEDICINE,
    'az_PyTXFG9c' => MEDICINE,
    'Xq9LFn7ddj8' => MEDICINE,
    'AO9Xg2Jn8Rg' => MEDICINE,
    'r0szxqTVGtY' => MEDICINE,
    '2jD0RXdNYas' => SURGERY,
    'o-dkb-YX3-E' => SURGERY,
    'Q0X2cP3C8R8' => SURGERY,
    '-1m87_1D_jc' => SURGERY,
    'UybrrVVOFCY' => ANESTHESIA,
    '8ZAN6vEuYjY' => RADIOLOGY,
    'oEmCcEio6nw' => RADIOLOGY,
    'F8TYLT0-5fs' => RADIOLOGY,
    'W_6v0v6tqCE' => RADIOLOGY,
    'DnBRarZKvoU' => RADIOLOGY,
    '7tDDDLqWnBQ' => RADIOLOGY,
    '4NNhGSXvbOU' => RADIOLOGY,
    '4oYBLkbDjhg' => RADIOLOGY,
    'z7_HseZBTT0' => RADIOLOGY,
    'i0fnBTUuRIA' => PEDIATRICS,
    'xDlwAry1HHY' => OBGYN,
    'vpw0bKOTDrs' => OBGYN,
    'R6XGStFZz_Q' => OBGYN
   }

  @order_by_id =  {
      '5uBE4uuTEMQ' => 1,
      'ta9KNbcq-KI' => 2,
      'T3xFzsgJBkU' => 3,
      '4fP7-XgSZnQ' => 4,
      'yoJzNL6XqkI' => 5,
      'wAMis_HNZWE' => 6,
      '3CyKCe8B894 ' => 7,
      'nopHyyI2vPY' => 8,
      'jzVBNyI9Ay8' => 9,
      'VACDx6QTJv4' => 10,
      '7w3F-U6j1yU' => 11,
      '63tXOFlDQS8' => 12,
      'A_lrwKVLNNE' => 13,
      'uRk6XVw4pnw' => 14,
      'WF1s01ePXLI' => 15,
      'y5TZT1IaQns' => 16,
      'H-pajljT5qE' => 17,
      'az_PyTXFG9c' => 18,
      'Xq9LFn7ddj8' => 19,
      'AO9Xg2Jn8Rg' => 20,
      'r0szxqTVGtY' => 21,
      '2jD0RXdNYas' => 22,
      'o-dkb-YX3-E' => 23,
      'Q0X2cP3C8R8' => 24,
      '-1m87_1D_jc' => 25,
      'UybrrVVOFCY' => 26,
      '8ZAN6vEuYjY' => 27,
      'oEmCcEio6nw' => 28,
      'F8TYLT0-5fs' => 29,
      'W_6v0v6tqCE' => 30,
      'DnBRarZKvoU' => 31,
      '7tDDDLqWnBQ' => 32,
      '4NNhGSXvbOU' => 33,
      '4oYBLkbDjhg' => 34,
      'z7_HseZBTT0' => 35,
      'i0fnBTUuRIA' => 36,
      'xDlwAry1HHY' => 37,
      'vpw0bKOTDrs' => 38,
      'R6XGStFZz_Q' => 39
  }


  def self.find_category(id)
      return @categories_by_id[id]
  end

  def self.find_order(id)
    return @order_by_id[id]
  end
end