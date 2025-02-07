import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const TarantulaTribeModule = buildModule("TarantulaTribeModule", (m) => {
  const baseURI = m.getParameter("baseURI", "ipfs://your-default-uri/");

  const tarantulaTribe = m.contract("TarantulaTribe", [baseURI]);

  return { tarantulaTribe };
});

export default TarantulaTribeModule;
