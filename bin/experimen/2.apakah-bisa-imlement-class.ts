{
    // disni kita akn cek, apakah kita bisa impelements class ke class lagi
    // harusnya kan ke kita si class nya implements iterface

    class A {

    }

    class B implements A{

    }

    // jadi bisa juga ya

    interface C {

    }

    // class D extends C {  ini g bisa

    // }

    class D implements C, A {} // bisa
}