// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {TFHE} from "../../FHE.sol";
import {Utils} from "./utils/Utils.sol";

error TestNotFound(string test);

contract GtTest {
    using Utils for *;
function gt(string calldata test, uint256 a, uint256 b) public pure returns (uint256 output) {
        if (Utils.cmp(test, "gt(euint8,euint8)")) {
            if (TFHE.decrypt(TFHE.gt(TFHE.asEuint8(a), TFHE.asEuint8(b)))) {
                return 1;
            }

            return 0;
        } else if (Utils.cmp(test, "gt(euint16,euint16)")) {
            if (TFHE.decrypt(TFHE.gt(TFHE.asEuint16(a), TFHE.asEuint16(b)))) {
                return 1;
            }

            return 0;
        } else if (Utils.cmp(test, "gt(euint32,euint32)")) {
            if (TFHE.decrypt(TFHE.gt(TFHE.asEuint32(a), TFHE.asEuint32(b)))) {
                return 1;
            }

            return 0;
        } else if (Utils.cmp(test, "euint8.gt(euint8)")) {
            if (TFHE.decrypt(TFHE.asEuint8(a).gt(TFHE.asEuint8(b)))) {
                return 1;
            }

            return 0;
        } else if (Utils.cmp(test, "euint16.gt(euint16)")) {
            if (TFHE.decrypt(TFHE.asEuint16(a).gt(TFHE.asEuint16(b)))) {
                return 1;
            }

            return 0;
        } else if (Utils.cmp(test, "euint32.gt(euint32)")) {
            if (TFHE.decrypt(TFHE.asEuint32(a).gt(TFHE.asEuint32(b)))) {
                return 1;
            }

            return 0;
        } else {
            revert TestNotFound(test);
        }
    }
}
