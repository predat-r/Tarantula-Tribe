import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const TarantulaTribeModule = buildModule("TarantulaTribeModule", (m) => {
  const baseURI = m.getParameter(
    "baseURI", 
    "ipfs://bafybeia26ygohk43wpfwuolm2qjtxg5ot2fmlwtstc3szfrjmqxtdxj2u4/"
  );

  const tarantulaTribe = m.contract("TarantulaTribe", [baseURI]);

  return { tarantulaTribe };
});

export default TarantulaTribeModule;
