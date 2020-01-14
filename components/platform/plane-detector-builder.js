import { PlaneDetector } from './planes-detector';

export default class PlaneDetectorBuilder {
  create() {
    return new PlaneDetector();
  }
}