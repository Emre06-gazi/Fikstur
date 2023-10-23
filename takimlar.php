<?php
class Takimlar {
    public $TakimID;
    public $TakimAdi;
    public $KulupBaskaniID;

    public function __construct($TakimID, $TakimAdi, $KulupBaskaniID) {
        $this->TakimID = $TakimID;
        $this->TakimAdi = $TakimAdi;
        $this->KulupBaskaniID = $KulupBaskaniID;
    }
}
?>
