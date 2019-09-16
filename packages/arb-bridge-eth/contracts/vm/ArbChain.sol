/*
 * Copyright 2019, Offchain Labs, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

pragma solidity ^0.5.3;

import "./ArbitrumVM.sol";

contract ArbChannel is ArbitrumVM {

    constructor(
        bytes32 _vmState,
        uint32 _gracePeriod,
        uint32 _maxExecutionSteps,
        uint128 _escrowRequired,
        address payable _owner,
        address _challengeManagerAddress,
        address _globalInboxAddress
    )
        ArbitrumVM(
            _vmState,
            _gracePeriod,
            _maxExecutionSteps,
            _escrowRequired,
            _owner,
            _challengeManagerAddress,
            _globalInboxAddress
        )
        public
    {
        vm.state = VM.State.Waiting;
    }

    function increaseDeposit() external payable {
        vm.validatorBalances[msg.sender] += msg.value;
    }

}
