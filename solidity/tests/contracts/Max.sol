// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { TFHE } from "../../FHE.sol";
import { Utils } from "./utils/Utils.sol";

error TestNotFound(string test);

contract MaxTest {
    using Utils for *;

    function max(string calldata test, uint256 a, uint256 b) public pure returns (uint256 output) {
        if (Utils.cmp(test, "max(euint8,euint8)")) {
            return TFHE.decrypt(TFHE.max(TFHE.asEuint8(a), TFHE.asEuint8(b)));
        } else if (Utils.cmp(test, "max(euint16,euint16)")) {
            return TFHE.decrypt(TFHE.max(TFHE.asEuint16(a), TFHE.asEuint16(b)));
        } else if (Utils.cmp(test, "max(euint32,euint32)")) {
            return TFHE.decrypt(TFHE.max(TFHE.asEuint32(a), TFHE.asEuint32(b)));
        } else if (Utils.cmp(test, "euint8.max(euint8)")) {
            return TFHE.decrypt(TFHE.asEuint8(a).max(TFHE.asEuint8(b)));
        } else if (Utils.cmp(test, "euint16.max(euint16)")) {
            return TFHE.decrypt(TFHE.asEuint16(a).max(TFHE.asEuint16(b)));
        } else if (Utils.cmp(test, "euint32.max(euint32)")) {
            return TFHE.decrypt(TFHE.asEuint32(a).max(TFHE.asEuint32(b)));
        } else {
            revert TestNotFound(test);
        }
    }

}