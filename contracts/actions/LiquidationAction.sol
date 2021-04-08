// SPDX-License-Identifier: GPL-3.0-only
pragma solidity >0.7.0;
pragma experimental ABIEncoderV2;

import "../common/Liquidation.sol";

contract LiquidationAction {

    function liquidateLocalCurrency(
        address liquidateAccount,
        uint localCurrency,
        uint96 maxPerpetualTokenLiquidation,
        uint blockTime
    ) external returns (BalanceState memory, int, PortfolioState memory) {
        return Liquidation.liquidateLocalCurrency(liquidateAccount, localCurrency, maxPerpetualTokenLiquidation, blockTime);
    }

    function liquidateCollateralCurrency(
        address liquidateAccount,
        uint localCurrency,
        uint collateralCurrency,
        uint128 maxCollateralLiquidation,
        uint96 maxPerpetualTokenLiquidation,
        uint blockTime
    ) external returns (BalanceState memory, int) {
        return Liquidation.liquidateCollateralCurrency(liquidateAccount, localCurrency,
            collateralCurrency, maxCollateralLiquidation, maxPerpetualTokenLiquidation, blockTime);
    }
}

contract LiquidationAction2 {
    function liquidatefCashLocal(
        address liquidateAccount,
        uint localCurrency,
        uint[] calldata fCashMaturities,
        uint[] calldata maxfCashLiquidateAmounts,
        uint blockTime
    ) external returns (int[] memory, int, PortfolioState memory) {
        return Liquidation.liquidatefCashLocal(liquidateAccount, localCurrency,
            fCashMaturities, maxfCashLiquidateAmounts, blockTime);
    }

    function liquidatefCashCrossCurrency(
        address liquidateAccount,
        uint localCurrency,
        uint collateralCurrency,
        uint[] calldata fCashMaturities,
        uint[] calldata maxfCashLiquidateAmounts,
        uint blockTime
    ) external returns (int[] memory, int, PortfolioState memory) {
        return Liquidation.liquidatefCashCrossCurrency(liquidateAccount, localCurrency,
            collateralCurrency, fCashMaturities, maxfCashLiquidateAmounts, blockTime);
    }

}
