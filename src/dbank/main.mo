import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank {
    stable var currentValue: Float = 300;
     //currentValue := 300;

    stable var startTime = Time.now();
    //startTime := Time.now();
    Debug.print(debug_show(startTime));

    // let id = 12335456567686;
    // Debug.print(debug_show(id));

    // Deposit
    public func topUp(amount: Float) {

        if(amount <= 0) {
            Debug.print("Invalid input!");
        } else {    
            currentValue += amount;
            Debug.print(debug_show(currentValue));
        }
    };

    // Withdrawal
    public func withdraw(amount: Float) {
        let tempValue: Float = currentValue - amount;
        if(tempValue >= 0) {
            currentValue -= amount;
            Debug.print(debug_show(currentValue));
        } else {
            Debug.print("Invalid input!");
        }
    };

    public query func checkBalance(): async Float {
        return currentValue;
    };

    public func compound() {
        let currentTime = Time.now();
        let timeElapsedNS = currentTime - startTime;
        let timeElapsedS = timeElapsedNS / 1000000000;

        currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
        startTime := currentTime;
    }

    //topUp();

    
    }