
#if not defined(_I_AM_LN_PROTOCOL_)
    #define _I_AM_LN_PROTOCOL_


        // -- LN-Protocol variables
    #define STX             0x02
    #define ETX             0x03
    #define MASTER_ADDRESS  0x00
    #define READ_PIN_CMD    0x01

        // definizione nome del byte del messaggio
    // #define STX             0x00
    #define MSG_NO_L         0x01
    #define MSG_NO_H         0x02
    #define DST_ADDR         0x03
    #define SRC_ADDR         0x04
    #define MSG_START        0x05

    #define RX_BUFFERSIZE    30
    #define TX_BUFFERSIZE    30


    #define RX_433MHz_Pin     D02
    #define TX_433MHz_Pin     D04
    #define LED               D13
    #define MASTER_PIN        D12

    #define BITS_PER_SEC      2000      // MAX = 10000 ???

    typedef enum Device{            // <-- the us of typedef is optional.
        MASTER,
        SLAVE01,
        SLAVE02,
        SLAVE03,
        SLAVE04,
        SLAVE05,
        BROADCAST=255,
        MAX_DEVICES
    };

    // char *Device[] = { "uno", "due",  "due"};

    // char *Device[255];
    // Device[0]   =   "MASTER";
    // Device[1]   =   "SLAVE01";
    // Device[2]   =   "SLAVE02";
    // Device[3]   =   "SLAVE03";
    // Device[4]   =   "SLAVE04";
    // Device[5]   =   "SLAVE05";
    // Device[6]   =   "SLAVE06";
    // Device[7]   =   "SLAVE07";
    // Device[254] =   "Broadcast";

    // #define ARRAYSIZE 255
    // String results[ARRAYSIZE] = {
    //      "uno",
    //      "duo",
    //      "tri"
    //  };

// enum Tools { SPANNER8,SPANNER10,SPANNER12, SPANNER14,NumberOfTools}; // enum is just a sequential list of items starting from 0
    char *deviceName[MAX_DEVICES] = {"MASTER", "SLAVE01", "SLAVE02", "SLAVE03"};
    // deviceName[255] = "BROADCAST";  // definirlo all'interno del setup()


    // char *Device[255] {
    //     "MASTER",
    //     "SLAVE01",
    //     "SLAVE02",
    //     "SLAVE03",
    //     "SLAVE04",
    //     "SLAVE05"
    // };
    // *(Device+254) = "ciao";

#endif
