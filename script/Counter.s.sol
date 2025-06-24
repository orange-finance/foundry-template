// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.29;

import {Counter} from "../src/Counter.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract CounterScript is Script {
    Counter public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        counter = new Counter();

        vm.stopBroadcast();
    }
}
